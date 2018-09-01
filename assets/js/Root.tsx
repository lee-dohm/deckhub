import * as React from 'react'

import PageHeader from './components/page-header'

export default class Root extends React.Component<{}, {}> {
  public render(): JSX.Element {
    return (
      <div className='Root'>
        <PageHeader />
        {this.props.children}
      </div>
    )
  }
}
