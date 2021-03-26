
import store from './store';

async function api_get(path) {
  let text = await fetch(
    "http://localhost:4000/api/v1" + path, {});

  let resp = await text.json();
  return resp.data;
}

async function api_post(path, data) {
  let opts = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data),
  };

  let text = await fetch(
    "http://localhost:4000/api/v1" + path, opts);

  return await text.json();
}

export function fetch_users() {
  api_get("/users").then((data) => {
    let action = {
      type: 'users/set',
      data: data
    }
    store.dispatch(action);
  });
}

export function fetch_comments() {
  api_get("/comments").then((data) => {
    let action = {
      type: 'comments/set',
      data: data
    }
    store.dispatch(action);
  });
}

export function fetch_responses() {
  api_get("/responses").then((data) => {
    let action = {
      type: 'responses/set',
      data: data
    }
    store.dispatch(action);
  });
}

export function fetch_events() {
  api_get("/events").then((data) => {
    let action = {
      type: 'events/set',
      data: data
    }
    store.dispatch(action);
  });
}

export function api_login(name, password) {
  api_post("/session", {name, password}).then((data) => {
    if (data.session) {
      let action = {
        type: 'session/set',
        data: data.session,
      }
      store.dispatch(action);
    }
    else if (data.error) {
      let action = {
        type: 'error/set',
        data: data.error,
      }
      store.dispatch(action);
    }
  });
}

export function create_user(user) {
  return api_post("/users", {user});
}

export function create_comment(comment) {
  return api_post("/comments", {comment});
}

export function create_response(response) {
  return api_post("/responses", {response});
}

export async function create_event(event) {
  let state = store.getState();
  let token = state?.session?.token;

  let data = new FormData();
  data.append("event[name]", event.name);
  data.append("event[date]", event.date);
  data.append("event[description]", event.description);


  let opts = {
    method: 'POST',
    body: data,
    headers: {
      'x-auth': token,
    }
  };

  let text = await fetch(
    "http://localhost:4000/api/v1/events", opts);

  return await text.json();
}

export function load_defaults() {
  fetch_users();
  fetch_events();
  fetch_comments();
}
