import React from 'react';
import ReactDOM from 'react-dom';
import { RDatePicker } from 'components/RDatePicker';


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <RDatePicker />,
    document.body.appendChild(document.createElement('div'))
  )
});
