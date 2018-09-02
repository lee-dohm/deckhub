import * as React from 'react'
import { Route } from 'react-router-dom'

import About from './components/about'
import CardDetail from './components/card-detail'
import CardList from './components/card-list'
import Home from './components/home'
import Root from './root'

export const routes = (
  <Root>
    <Route exact path="/" component={Home} />
    <Route exact path="/about" component={About} />
    <Route exact path="/cards" component={CardList} />
    <Route path="/card/:slug" component={CardDetail} />
  </Root>
)
