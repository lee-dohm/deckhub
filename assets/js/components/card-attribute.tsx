import * as React from 'react'

interface CardAttributeProps {
  name: string,
  value: string | number | boolean
}

export default class CardAttribute extends React.Component<CardAttributeProps, {}> {
  public render() {
    return (
      <tr className={'CardAttribute-' + this.props.name}>
        <th>{this.props.name}</th>
        <td>{this.props.value}</td>
      </tr>
    )
  }
}
