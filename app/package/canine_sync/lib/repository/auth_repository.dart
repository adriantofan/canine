import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../api/api_client.dart';
import 'auth_status.dart';
import 'profile_repository.dart';

/// Thrown during the sign up process if a failure occurs.
class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthRepository {
  /// {@macro authentication_repository}
  AuthRepository({
    // CacheClient? cache,
    required this.apiClient,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    ProfileRepository? profileRepository,
  })  :
        // _cache = cache ?? CacheClient(),

        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _profileRepository =
            profileRepository ?? ProfileRepositorySharedPreferences();

  // final CacheClient _cache;
  final APIClientBase apiClient;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final ProfileRepository _profileRepository;
  final _loger = Logger('AuthRepository');

  /// Whether or not the current environment is web
  /// Should only be overridden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  // /// Stream of [User] which will emit the current user when
  // /// the authentication state changes.
  // ///
  // /// Emits [User.empty] if the user is not authenticated.
  // Stream<User> get user {
  //   return _firebaseAuth.authStateChanges().map((firebaseUser) {
  //     final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
  //     _cache.write(key: userCacheKey, value: user);
  //     return user;
  //   });
  // }
  //
  // /// Returns the current cached user.
  // /// Defaults to [User.empty] if there is no cached user.
  // User get currentUser {
  //   return _cache.read<User>(key: userCacheKey) ?? User.empty;
  // }

  final _authStatusSubject =
      BehaviorSubject<AuthStatus>.seeded(const AuthStatus.unknown());

  AuthStatus _rawAuthStatus = const AuthStatus.unknown();

  AuthStatus get authStatus => _rawAuthStatus;

  set _authStatus(AuthStatus value) {
    _rawAuthStatus = value;
    _authStatusSubject.add(value);
  }

  Stream<AuthStatus> get authStatusStream => _authStatusSubject.stream;
  bool get isAuthenticated => authStatus is AuthStatusAuthenticated;

  int? workspaceId;
  _authStatusRefresh() async {
    workspaceId = await _profileRepository.workspaceId;
    // if (_firebaseAuth.currentUser == null) {
    //   if (workspaceId == null) {
    //     _authStatus = const AuthStatus.disconnected();
    //   } else {
    //     _authStatus = const AuthStatus.login(AuthStatusLoginState.disconnected);
    //   }
    // }

    _firebaseAuth.idTokenChanges().listen(idTokenDidChange);
  }

  idTokenDidChange(firebase_auth.User? event) async {
    switch (_rawAuthStatus) {
      case AuthStatusUnknown():
        if (event == null) {
          if (workspaceId == null) {
            _authStatus = const AuthStatus.disconnected();
          } else {
            _authStatus =
                const AuthStatus.login(AuthStatusLoginState.disconnected);
          }
        } else {
          await idTokenUpdateUser(event);
        }
      case AuthStatusDisconnected():
        if (event != null) {
          logOut();
        }
      case AuthStatusLogin():
        if (event == null) {
          _authStatus =
              const AuthStatus.login(AuthStatusLoginState.disconnected);
          return;
        }
        await idTokenUpdateUser(event);
      case AuthStatusAuthenticated():
        if (event == null) {
          _authStatus =
              const AuthStatus.login(AuthStatusLoginState.disconnected);
        } else {
          await idTokenUpdateUser(event);
        }
    }
  }

  idTokenUpdateUser(firebase_auth.User user) async {
    switch (_rawAuthStatus) {
      case AuthStatusUnknown():
        if (workspaceId == null) {
          logOut(); // should not get user without workspace
        } else {
          _authStatus = const AuthStatus.login(AuthStatusLoginState.connecting);
        }
      case AuthStatusDisconnected():
        _loger.warning('Got firebase user, but not authenticated. Logging out');
        logOut();
      case AuthStatusLogin(state: var state):
        switch (state) {
          case AuthStatusLoginState.disconnected:
            _authStatus =
                const AuthStatus.login(AuthStatusLoginState.connecting);
            break;
          case AuthStatusLoginState.connecting:
          case AuthStatusLoginState.link:
          case AuthStatusLoginState.rejected:
          // nothing to do, just the FB token who changes
        }
      case AuthStatusAuthenticated():
        await _refreshBEToken(user);
    }
  }

  _refreshBEToken(firebase_auth.User user) async {
    assert(workspaceId != null);
    assert(authStatus is AuthStatusAuthenticated);

    final token = await user.getIdToken();
    // TODO: implement refresh token
    // What happens if it fails ? How many times to retry and how to cancel?
    apiClient.loginFirebase(workspaceId!, token!);
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUp(
      {required int workspaceId,
      required String email,
      required String password}) async {
    final firebase_auth.UserCredential credential;
    try {
      credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
    final token = await credential.user!.getIdToken();
    apiClient.loginFirebase(workspaceId, token!);
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      await _firebaseAuth.signInWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

// extension on firebase_auth.User {
//   /// Maps a [firebase_auth.User] into a [User].
//   User get toUser {
//     return User(id: uid, email: email, name: displayName, photo: photoURL);
//   }
// }
