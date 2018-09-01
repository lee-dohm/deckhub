import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'

export default class Home extends React.Component<{}, {}> {
  constructor(props) {
    super(props)
  }

  public render(): JSX.Element {
    return (
      <div>
        Hello, world!
      </div>
    )
  }
}
