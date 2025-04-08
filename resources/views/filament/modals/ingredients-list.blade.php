<form wire:submit.prevent="updateIngredients">
    <div class="space-y-4">
        @foreach($ingredients as $ingredient)
            <div class="flex items-center gap-4 border-b pb-2">
                <img src="{{ Storage::url($ingredient->image) }}" alt="{{ $ingredient->name }}" class="w-16 h-16 object-cover rounded-md">
                <div>
                    <p class="text-lg font-semibold">{{ $ingredient->name }}</p>
                    <input type="number" wire:model="updatedQuantities.{{ $ingredient->id }}"
                        class="border p-2 rounded-md w-24"
                        placeholder="Số lượng tồn kho">
                </div>
            </div>
        @endforeach
    </div>

    <div class="mt-4">
        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md">Cập nhật</button>
    </div>
</form>
