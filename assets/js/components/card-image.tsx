import * as React from 'react'
import { RouteComponentProps } from 'react-router-dom'

interface CardImageProps {
  image: string
}

export default class CardImage extends React.Component<CardImageProps, {}> {
  constructor(props: CardImageProps) {
    super(props)
  }

  render() {
    return (
      <img src={this.props.image} />
    )
  }
}
