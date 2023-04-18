
const orderForm = document.getElementById('order-form');
const appetizers = document.getElementById('appetizers');
const entrees = document.getElementById('entrees');
const drinks = document.getElementById('drinks');
const submitBtn = document.getElementById('submit-btn');
const total = document.getElementById('total');

function calculateTotal() {
  const appetizersPrice = parseFloat(appetizers.value);
  const entreesPrice = parseFloat(entrees.value);
  const drinksPrice = parseFloat(drinks.value);
  

  const totalPrice = appetizersPrice + entreesPrice + drinksPrice ;
  total.innerText = `${totalPrice.toFixed(2)}`;
}

orderForm.addEventListener('submit', function(e) {
  e.preventDefault();
  calculateTotal();
});

//appetizers.addEventListener('change', calculateTotal);
//entrees.addEventListener('change', calculateTotal);
//drinks.addEventListener('change', calculateTotal);
