<?php

namespace App\Helpers;

use App\Models\Dish;
use Illuminate\Support\Facades\Cookie;

class CartManagement
{
    // Add item to the cart
    static public function addItemToCart($productId, $quantity)
    {
        $cart_items = self::getCartItemsFromCookie();
        $existing_item = null;

        // Check if the item already exists in the cart
        foreach ($cart_items as $key => $item) {
            if ($item['product_id'] == $productId) {
                $existing_item = $key;
                break;
            }
        }

        if ($existing_item !== null) {
            // Increment quantity and update total amount
            $cart_items[$existing_item]['quantity'] += $quantity;
            $cart_items[$existing_item]['total_amount'] = $cart_items[$existing_item]['quantity'] *
                $cart_items[$existing_item]['unit_amount'];
        } else {
            // Fetch the product details from the database
            $product = Dish::find($productId);
            if ($product) {
                $cart_items[] = [
                    'name' => $product->name,
                    'price' => $product->price,
                    'product_id' => $product->id, // Sử dụng id của sản phẩm
                    'product_slug' => $product->slug, // Lấy slug của sản phẩm
                    'image' => $product->image, // Lấy ảnh của sản phẩm
                    'quantity' => $quantity,
                    'unit_amount' => $product->price,
                    'total_amount' => $product->price * $quantity,
                ];
            }
        }

        // Save updated cart items to cookie
        self::addCartItemsToCookie($cart_items);
        return count($cart_items);
    }
    static public function countCart()
    {
        $cart_items = self::getCartItemsFromCookie();
        return array_sum(array_column($cart_items, 'quantity'));
    }
    static public function updateQuantityInCart($productId, $quantity)
    {
        $cart_items = self::getCartItemsFromCookie();
        foreach ($cart_items as $key => $item) {
            if ($item['product_id'] == $productId) {
                $cart_items[$key]['quantity'] = $quantity;
                $cart_items[$key]['total_amount'] = $quantity * $item['unit_amount'];
                break;
            }
        }
        self::addCartItemsToCookie($cart_items);
        return $cart_items;
    }
    // Add cart item to cookie
    static public function addCartItemsToCookie($cart_items)
    {
        Cookie::queue('cart_items', json_encode($cart_items), 60 * 24 * 30);
    }

    // Remove cart item from cookie
    static public function removeCartItem($product_id)
    {
        $cart_items = self::getCartItemsFromCookie();
        foreach ($cart_items as $key => $item) {
            if ($item['product_id'] == $product_id) {
                unset($cart_items[$key]);
                break; // Exit loop after removing the item
            }
        }
        self::addCartItemsToCookie(array_values($cart_items)); // Reindex the array
        return $cart_items;
    }

    // Clear cart items from cookie
    static public function clearCartItems()
    {
        Cookie::queue(Cookie::forget('cart_items'));
    }

    // Get all cart items from cookie
    static public function getCartItemsFromCookie()
    {
        $cart_items = json_decode(Cookie::get('cart_items'), true);
        return $cart_items ?: []; // Return empty array if no items found
    }

    // Increment item quantity
    static public function incrementQuantityToCartItem($product_id)
    {
        $cart_items = self::getCartItemsFromCookie();
        foreach ($cart_items as $key => $item) {
            if ($item['product_id'] == $product_id) {
                $cart_items[$key]['quantity']++;
                $cart_items[$key]['total_amount'] = $cart_items[$key]['quantity'] * $cart_items[$key]['unit_amount'];
                break; // Exit loop after updating the item
            }
        }
        self::addCartItemsToCookie($cart_items);
        return $cart_items;
    }

    // Decrement quantity
    static public function decrementQuantityToCartItem($product_id)
    {
        $cart_items = self::getCartItemsFromCookie();
        foreach ($cart_items as $key => $item) {
            if ($item['product_id'] == $product_id) {
                if ($cart_items[$key]['quantity'] > 1) {
                    $cart_items[$key]['quantity']--;
                    $cart_items[$key]['total_amount'] = $cart_items[$key]['quantity'] * $cart_items[$key]['unit_amount'];
                } else {
                    // If quantity is 1, we might want to remove the item instead
                    unset($cart_items[$key]);
                }
                break; // Exit loop after updating the item
            }
        }
        self::addCartItemsToCookie(array_values($cart_items)); // Reindex the array
        return $cart_items;
    }

    public static function updateCartItemsInCookie($cartItems)
    {
        setcookie('cart_items', json_encode($cartItems), time() + (30 * 24 * 60 * 60), '/');
    }

    // Calculate grand total
    static public function calculateGrandTotal($items)
    {
        return array_sum(array_column($items, 'total_amount'));
    }
}
