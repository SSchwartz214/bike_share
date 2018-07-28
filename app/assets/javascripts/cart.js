

function display_quantity()
{
  var total = 0;
  for(var accessory in accessories)
  {
    if (!accessories.hasOwnProperty(accessory))
    {
      continue;
    }
    document.getElementById(accessory + "_quantity").innerHTML = accessories[accessory].quantity;
    document.getElementById("update_accessory_" + accessory).value = accessories[accessory].quantity.toString();
    subtotal = accessories[accessory].quantity * accessories[accessory].price;
    total += subtotal;
    document.getElementById(accessory + "_subtotal").innerHTML = subtotal;
  }
  document.getElementById("total").innerHTML = total;
}

function increment(accessory)
{
  accessories[accessory].quantity++;
  display_quantity();
}

function decrement(accessory)
{
  accessories[accessory].quantity--;
  display_quantity();
}

function update()
{
  document.getElementById("exit_values").submit();
}
