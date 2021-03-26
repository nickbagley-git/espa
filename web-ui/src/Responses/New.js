import { Row, Col, Form, Button } from 'react-bootstrap';
import { useState } from 'react';
import { useHistory } from 'react-router-dom';
import { create_response, fetch_responses } from '../api';
import pick from 'lodash/pick';


export default function ResponsessNew() {
  let history = useHistory();
  const [response, setResponse] = useState({
    body: ""
  });


  function submit(ev) {
    ev.preventDefault();
    let data = pick(response, ['body']);
    create_response(data).then(() => {
      fetch_responses();
      history.push("/");
    });
  }



  function update(field, ev) {
    let c1 = Object.assign({}, response);
    c1[field] = ev.target.value;
    setResponse(c1);
  }


  return (
    <Row>
      <Col>
        <h2>Respond</h2>
        <Form onSubmit={submit}>
        <Form.Group>
          <Form.Label>Body</Form.Label>
          <Form.Control type="text" onChange={
            (ev) => update("body", ev)} value={response.body} />
        </Form.Group>
          <Button variant="primary" type="submit">
            Send Response
          </Button>
        </Form>
      </Col>
    </Row>
  );
}
