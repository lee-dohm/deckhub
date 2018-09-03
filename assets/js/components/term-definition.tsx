import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'

import MarkdownBody from './markdown-body'

interface Term {
  key: string,
  value: string
}

type TermDefinitionProps = RouteComponentProps<{term: string}>

interface TermDefinitionState {
  term: Term | null
}

const API = 'http://localhost:4000/api'
const QUERY = '/glossary/'

export default class TermDefinition extends React.Component<TermDefinitionProps, TermDefinitionState> {
  constructor(props: any) {
    super(props)

    this.state = {
      term: null
    }
  }

  async componentDidMount() {
    const response = await fetch(`${API}${QUERY}${this.props.match.params.term}`)
    const term = await response.json()

    this.setState({term: term})
  }

  public render() {
    const {term} = this.state

    if (!term) {
      return (
        <div className='TermDefinition'>
          Loading ...
        </div>
      )
    }

    return (
      <div className='TermDefinition'>
        <h2>{this.humanizeKey(term.key)}</h2>
        <MarkdownBody markdown={term.value} />
      </div>
    )
  }

  private humanizeKey(key: string): string {
    return key.charAt(0).toUpperCase() + key.slice(1)
  }
}
