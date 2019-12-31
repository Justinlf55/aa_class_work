import React from 'react';
import ReactDOM from 'react-dom';

import { receiveAllPokemon } from './actions/pokemon_actions.js';
import { fetchAllPokemon } from './util/api_util.js';
import configureStore from './store/store.js';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();

  window.store = store;

  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;

  ReactDOM.render(<h1>Pokedex</h1>, root);
});