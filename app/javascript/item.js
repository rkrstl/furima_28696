window.addEventListener("turbolinks:load", function(){

   const priceItem = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
   
     priceItem.addEventListener('keyup', () => {
         const value = priceItem.value; 
         
       if (value >= 300 && value <= 9999999){
        let fee = Math.floor(value * 0.1);
        let gains = value - fee;
         add_tax.textContent = fee;
         profit.textContent = gains;
     } else {
       let fee = '-';
       let gains = '-';
       add_tax.textContent = fee;
       profit.textContent = gains;
     }
   }); 
  })
