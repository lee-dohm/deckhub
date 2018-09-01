import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'

import CardImage from './CardImage'

interface Card {
  image: string,
  name: string
}

interface CardDetailState {
  card: Card | null
}

const API = 'http://localhost:4000/api'
const QUERY = '/cards/ysera'

export default class CardDetail extends React.Component<{}, CardDetailState> {
  constructor(props: any) {
    super(props)

    this.state = {
      card: null
    }
  }

  componentDidMount() {
    fetch(API + QUERY)
      .then(response => response.json())
      .then(card => this.setState({card: card}))
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
