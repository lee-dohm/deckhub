import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'

import CardImage from './card-image'

interface Card {
  image: string,
  name: string
}

type CardDetailProps = RouteComponentProps<{slug: string}>

interface CardDetailState {
  card: Card | null
}

const API = 'http://localhost:4000/api'
const QUERY = '/cards/'

export default class CardDetail extends React.Component<CardDetailProps, CardDetailState> {
  constructor(props: any) {
    super(props)

    this.state = {
      card: null
    }
  }

  async componentDidMount() {
    const response = await fetch(`${API}${QUERY}${this.props.match.params.slug}`)
    const card = await response.json()

    this.setState({card: card})
  }

  render() {
    const {card} = this.state

    if (!card) {
      return (
        <div className='CardDetail'>
          Loading ...
        </div>
      )
    }

    return (
      <div className='CardDetail'>
        <CardImage image={card.image} />
        <p>{card.name}</p>
      </div>
    )
  }
}
