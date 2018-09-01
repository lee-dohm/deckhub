import * as React from 'react'
import { Route } from 'react-router-dom'

import About from './components/About'
import CardDetail from './components/CardDetail'
import CardList from './components/CardList'
import Home from './components/Home'
import Root from './Root'

export const routes = (
  <Root>
    <Route exact path="/" component={Home} />
    <Route exact path="/about" component={About} />
    <Route exact path="/cards" component={CardList} />
    <Route path="/card/:slug" component={CardDetail} />
  </Root>
)
