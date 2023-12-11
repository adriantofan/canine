module Home exposing (Model, Msg, view, update, init)
import Html exposing (..)

type alias Model = ()
type alias Msg = ()

view : Model -> Html Msg
view model =
    div [] [ text "Welcome to canine, your friendly AI assisted communication companion" ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )

init : ( Model, Cmd Msg )
init =
    ( (), Cmd.none )
