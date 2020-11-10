window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  priceInput.addEventListener('input', function(){
    const item_price = priceInput.value; 
    addTaxDom.innerHTML = Math.floor(item_price * 0.1)
    profit.innerHTML = Math.floor(item_price * 0.9)
  })
})