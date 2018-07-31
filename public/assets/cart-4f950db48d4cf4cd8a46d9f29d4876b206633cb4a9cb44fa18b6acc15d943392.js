

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
  if(accessories[accessory].quantity > 1)
  {
    accessories[accessory].quantity--;
  }
  else
  {
    autoRemove(accessory);
  }
  display_quantity();
}

function update()
{
  document.getElementById("exit_values").submit();
}

function checkFlash()
{
  var text_field = document.getElementById("cart-remove");
  if(text_field)
  {
    text_field.innerHTML="<a href='/accessories/" + lastRemoved.toString() + "' >" + lastRemovedName + " </a>";
  }
}
;
