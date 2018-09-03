import * as React from 'react'

import CodeWithHeart from './code-with-heart'

export default class PageFooter extends React.Component<{}, {}> {
  public render(): JSX.Element {
    return (
      <footer className='PageFooter col-12 float-left border-top p-3 mt-3'>
        <CodeWithHeart name='Lee Dohm' repo='https://github.com/lee-dohm/deckhub' />
      </footer>
    )
  }
}
