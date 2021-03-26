
import { Row, Col, Card } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';


function Event({event, session}) {
  return(
    <Col md="3">
      <Card>
        <Card.Text>
        <h2>{event.name}</h2>
        <p>Posted by {event.user.name}</p>
        <p>Date: {event.date}</p>
        <p>Description: {event.description}</p>
        <p><Link to="/responses/new">Respond</Link></p>
        <br/>
        <p>Comments: </p>
        <p><Link to="/comments/new">Add Comment</Link></p>
        <p>{event.comments}</p>
        </Card.Text>
      </Card>
    </Col>
  );
}

function Feed({events, session}) {
  let cards = events.map((event) => (
      <Event event={event} key={event.id} />
  ));

  let new_link = null;
  if (session) {
    new_link = (<p><Link to="/events/new">New Event</Link></p>)
  }

  return (
    <div>
      <h2>Feed</h2>
      { new_link }
      <Row>{cards}</Row>
    </div>
  );
}

export default connect(({events, session}) => ({events, session}))(Feed);
