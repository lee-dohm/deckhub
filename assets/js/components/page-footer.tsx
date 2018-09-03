import * as React from 'react'
import Octicon, {MarkGithub} from '@githubprimer/octicons-react'

import AboutLink from './about-link'
import CodeWithHeart from './code-with-heart'
import GitHubLink from './github-link'

export default class PageFooter extends React.Component<{}, {}> {
  public render(): JSX.Element {
    return (
      <footer className='PageFooter container-lg'>
        <div className='columns'>
          <div className='two-fifths column centered'>
            <div className='border-top text-center small my-2 pt-2'>
              <AboutLink />
              <span className='px-3' />
              <GitHubLink repo='https://github.com/lee-dohm/deckhub' />
            </div>
            <div className='text-center small my-2'>
              <CodeWithHeart name='Lee Dohm' repo='https://www.lee-dohm.com' />
            </div>
          </div>
        </div>
      </footer>
    )
  }
}
