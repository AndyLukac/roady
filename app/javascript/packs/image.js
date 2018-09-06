const image = document.querySelector('#journey_name')

if (image) {
  image.addEventListener('blur', (event) => {
    const city = image.value;

    fetch(`/image?query=${city}`)
      .then((response) => response.json())
      .then((data) => {
        const form = document.querySelector('.add-journey-form');
        form.style.backgroundImage = `url('${data[0]}')`;
      });
  });
}
