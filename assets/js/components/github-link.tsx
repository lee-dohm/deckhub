import * as React from 'react'
import Octicon, {MarkGithub} from '@githubprimer/octicons-react'

interface GitHubLinkProps {
  repo: string
}

export default class GitHubLink extends React.Component<GitHubLinkProps, {}> {
  public render(): JSX.Element {
    return (
      <a
        className='link-gray-dark tooltipped tooltipped-n'
        aria-label='View this project on GitHub'
        href={this.props.repo}>
        <Octicon icon={MarkGithub} />
      </a>
    )
  }
}
