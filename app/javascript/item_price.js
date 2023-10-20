document.addEventListener("turbo:load", function() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", function() {
    const price = parseFloat(priceInput.value) || 0;
    const tax = Math.round(price * 0.1);
    const calculatedProfit = price - tax;

    addTaxPrice.textContent = tax.toString();
    profit.textContent = calculatedProfit.toString(); 
  });
});
