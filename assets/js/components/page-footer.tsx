import * as React from 'react'

import CodeWithHeart from './code-with-heart'

export default class PageFooter extends React.Component<{}, {}> {
  public render(): JSX.Element {
    return (
      <footer className='PageFooter container my-5'>
        <CodeWithHeart name='Lee Dohm' repo='https://github.com/lee-dohm/deckhub' />
      </footer>
    )
  }
}
