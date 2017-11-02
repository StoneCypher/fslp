
{

  // used in cycles and stripes
  function signflip({ term, value, location }) {
    return { term, value: value * -1, location };
  }

}
