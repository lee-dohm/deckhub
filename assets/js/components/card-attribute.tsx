import * as React from 'react'

import MarkdownBody from './markdown-body'

interface CardAttributeProps {
  name: string,
  value: string | number | boolean
}

export default class CardAttribute extends React.Component<CardAttributeProps, {}> {
  public render() {
    const {name, value} = this.props

    if (name === 'text' && typeof value === 'string') {
      return (
        <tr className={'CardAttribute text'}>
          <th>Text</th>
          <td>
            <MarkdownBody markdown={value} />
          </td>
        </tr>
      )
    }

    return (
      <tr className={'CardAttribute ' + name}>
        <th>{this.humanizeName(name)}</th>
        <td>{this.humanizeValue(name, value)}</td>
      </tr>
    )
  }

  private humanizeEnum(value: string): string {
    if (!value) {
      return value
    }

    return value.charAt(0) + value.slice(1).toLowerCase()
  }

  private humanizeName(name: string): string {
    if (name === 'dbf_id') {
      return 'DBF ID'
    }

    if (name === 'card_id') {
      return 'Card ID'
    }

    if (name === 'card_class') {
      return 'Usable by class'
    }

    return name.charAt(0).toUpperCase() + name.slice(1)
  }

  private humanizeSet(value: string): string {
    switch (value) {
      case 'BOOMSDAY':
        return 'The Boomsday Project'

      case 'BRM':
        return 'Blackrock Mountain'

      case 'EXPERT1':
        return 'Classic'

      case 'GILNEAS':
        return 'The Witchwood'

      case 'GVG':
        return 'Goblins vs. Gnomes'

      case 'ICECROWN':
        return 'Knights of the Frozen Throne'

      case 'LOOTAPALOOZA':
        return 'Kobolds & Catacombs'

      case 'NAXX':
        return 'Naxxramas'

      case 'OG':
        return 'Whispers of the Old Gods'

      case 'UNGORO':
        return "Journey to Un'Goro"

      default:
        return this.humanizeEnum(value)
    }
  }

  private humanizeValue(name: string, value: any): any {
    switch (name) {
      case 'set':
        return this.humanizeSet(value)

      case 'type':
      case 'race':
      case 'rarity':
      case 'card_class':
        return this.humanizeEnum(value)

      default:
        return value
    }
  }
}
