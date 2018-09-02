import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'

import CardAttribute from './card-attribute'
import CardImage from './card-image'

interface Card {
  armor: number,
  artist: string,
  attack: number,
  card_class: string,
  card_id: string,
  collectible: boolean,
  cost: number,
  dbf_id: number,
  durability: number,
  elite: boolean,
  flavor: string,
  health: number,
  image: string,
  name: string,
  race: string,
  rarity: string,
  set: string,
  slug_name: string,
  small_image: string,
  text: string,
  type: string
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
        <div className='col-4 float-left'>
          <CardImage image={card.small_image} />
        </div>
        <div className='col-8 float-left'>
          <table className='data-table'>
            <tbody>
              <CardAttribute name='armor' value={card.armor} />
              <CardAttribute name='cost' value={card.cost} />
            </tbody>
          </table>
        </div>
      </div>
    )
  }
}
