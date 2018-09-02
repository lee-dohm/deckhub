import * as React from 'react'
import Octicon, {Code, Heart} from '@githubprimer/octicons-react'

interface CodeWithHeartProps {
  name: string,
  repo: string
}

export default class CodeWithHeart extends React.Component<CodeWithHeartProps, {}> {
  public render(): JSX.Element {
    return (
      <div className='CodeWithHeart text-center'>
        <Octicon icon={Code} />
        {' with '}
        <Octicon icon={Heart} />
        {' by '}
        <a className='link-gray-dark' href={this.props.repo}>{this.props.name}</a>
      </div>
    )
  }
}
