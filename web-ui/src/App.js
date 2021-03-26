
import { Container } from 'react-bootstrap';
import { Switch, Route } from 'react-router-dom';

import "./App.scss";
import Nav from './Nav';
import UsersList from "./Users/List";
import UsersNew from "./Users/New";
import EventsNew from "./Events/New";
import CommentsNew from "./Comments/New";
import ResponsesNew from "./Responses/New";
import Feed from './Feed';


function App() {
  return (
    <Container>
      <Nav />
      <Switch>
        <Route path="/" exact>
          <Feed />
        </Route>
        <Route path="/events/new" exact>
          <EventsNew />
        </Route>
        <Route path="/users" exact>
          <UsersList />
        </Route>
        <Route path="/users/new" exact>
          <UsersNew />
        </Route>
        <Route path="/comments/new" exact>
          <CommentsNew />
        </Route>
        <Route path="/responses/new" exact>
          <ResponsesNew />
        </Route>
      </Switch>
    </Container>
  );

}

export default App;
