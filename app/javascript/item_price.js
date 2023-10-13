document.addEventListener("DOMContentLoaded", function() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  // 価格フィールドに対するinputイベントをリッスン
  priceInput.addEventListener("input", function() {
    // 価格フィールドの値を取得し、数値に変換
    const price = parseFloat(priceInput.value) || 0;

    // 手数料計算 (10%)
    const tax = price * 0.1;

    // 利益計算
    const calculatedProfit = price - tax;

    // 結果を表示
    addTaxPrice.textContent = tax.toFixed(0); // ()の中は小数点の数
    profit.textContent = calculatedProfit.toFixed(0); 
  });
});
