<?php

namespace App\Filament\Resources\DishResource\Pages;

use App\Filament\Resources\DishResource;
use App\Models\Dish;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Storage;
class ListDishes extends ListRecords
{
    protected static string $resource = DishResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
            ->label('Tạo mới món ăn'),
            // \EightyNine\ExcelImport\ExcelImportAction::make()
            // ->processCollectionUsing(function (string $modelClass, Collection $collection) {
            //     foreach ($collection as $item) {
            //         // Convert item to array
            //         $itemArray = $item->toArray();
            //         // Access the name property
            //         $name = $itemArray['name'];

            //         // Generate a unique slug
            //         if (empty($itemArray['slug'])) {
            //             $slug = $this->generateUniqueSlug(Str::slug($name));
            //         } else {
            //             $slug = $itemArray['slug'];
            //         }

            //         // Save the image to storage
            //         $imagePath = null;
            //         if (!empty($itemArray['image'])) {
            //             // Retrieve the image content
            //             $imageContents = file_get_contents($itemArray['image']);

            //             // Get the image information
            //             $imageInfo = getimagesize($itemArray['image']);
            //             $extension = image_type_to_extension($imageInfo[2]); // Get the extension (e.g., .jpg)

            //             // Define a unique filename
            //             $filename = Str::slug($name) . '-' . time() . $extension; // Add the extension
            //             // Store the image in the public disk
            //             Storage::disk('public')->put($filename, $imageContents);
            //             // Get the path to store in the database
            //             $imagePath = 'storage/' . $filename; // Adjust according to your storage setup
            //         }

            //         // Create product if image is successfully saved
            //         if ($imagePath) {
            //             Dish::create(array_merge($itemArray, [
            //                 'image' => $imagePath,
            //                 'restaurant_id' => 1,
            //                 'food_category_id' => $itemArray['category_id'],
            //                 'name' => $name,
            //                 'description' => $itemArray['name'],
            //                 'price' => $itemArray['price'],
            //                 'slug' => $slug,
            //                 'sold_quantity' => 0,
            //             ]));
            //         }
            //     }
            // }),

        ];
    }
    private function generateUniqueSlug(string $slug): string
    {
        $originalSlug = $slug;
        $counter = 1;

        // Check for existing slugs in the database
        while (Dish::where('slug', $slug)->exists()) {
            $slug = $originalSlug . '-' . $counter;
            $counter++;
        }

        return $slug;
    }
}
