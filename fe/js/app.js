import {Elm} from '../src/Main.elm';
import {setupSSE} from "./sse";

app = Elm.Main.init({ node: document.getElementById('canine-app') });



// Initialize the SSE connection
setupSSE();