import * as React from 'react'

interface MarkdownBodyProps {
  markdown: string
}

export default class MarkdownBody extends React.Component<MarkdownBodyProps, {}> {
  public render() {
    const {markdown} = this.props

    return <div className='markdown-body' dangerouslySetInnerHTML={{ __html: markdown }} />
  }
}
