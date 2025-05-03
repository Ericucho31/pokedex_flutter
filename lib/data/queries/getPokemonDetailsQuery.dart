const String pokemonDetailsQuery = r'''
  query pokemonDetailsQuery($pokemonId: Int!) {
    pokemon_v2_pokemon(where: {id: {_eq: $pokemonId}}) {
    id
    name
    weight
    height
    pokemon_v2_pokemonabilities {
      pokemon_v2_ability {
        id
        name
        pokemon_v2_abilityeffecttexts(where: {language_id: {_eq: 9}}) {
          short_effect
          language_id
        }
      }
      is_hidden
    }
    pokemon_v2_pokemontypes {
      slot
      pokemon_v2_type {
        id
        name
        pokemonV2TypeefficaciesByTargetTypeId {
          id
          damage_factor
          pokemon_v2_type {
            name
            id
          }
        }
      }
    }
    pokemon_v2_pokemonstats {
      base_stat
      stat_id
    }
    pokemon_v2_pokemonsprites(where: {}) {
      sprites(path: "other")
      id
    }
  }
  pokemon_v2_pokemonspeciesflavortext(
    where: {pokemon_species_id: {_eq: $pokemonId}, language_id: {_eq: 9}}
    limit: 2
    order_by: {id: desc}
  ) {
    pokemon_species_id
    flavor_text
    pokemon_v2_version {
      id
      name
    }
  }
}
  ''';