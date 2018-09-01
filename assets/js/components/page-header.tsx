import * as React from 'react'

export default class PageHeader extends React.Component<{}, {}> {
  public render(): JSX.Element {
    return (
      <div className='PageHeader bg-gray-dark text-white p-3'>
        <div className='d-flex flex-justify-between'>
          <a className='text-white no-underline' href='/'>Deckhub</a>
          <nav className='flex-self-center'>
            <a className='text-white' href='/about/'>About</a>
          </nav>
        </div>
      </div>
    )
  }
}
