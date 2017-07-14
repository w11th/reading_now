import React from 'react';
import DatePicker from 'antd/lib/date-picker';
import 'antd/lib/date-picker/style';
import message from 'antd/lib/message';
import 'antd/lib/message/style';

export class RDatePicker extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      date: ''
    };
  }

  handleChange(date) {
    message.info('您选择的日期是：' + date.toString());
    this.setState({ date });
  }

  render() {
    return (
      <div style={{ width: 400, margin: '100px auto' }}>
        <DatePicker onChange={ value => this.handleChange(value) }/>
        <div style={{ marginTop: 20 }}>
          当前日期：{ this.state.date.toString() }
        </div>
      </div>
    )
  }
}
