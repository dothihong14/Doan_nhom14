<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Contact as ContactModel;

class Contact extends Component
{
    public $name;
    public $email;
    public $message;

    public function submit()
    {
        if ($this->name == '' || $this->email == '' || $this->message == '') {
            session()->flash('error', 'Please fill in all fields');
            return;
        }

        // Create a new contact entry
        ContactModel::create([
            'name' => $this->name,
            'email' => $this->email,
            'message' => $this->message,
        ]);

        // Reset the form fields
        $this->reset();

        // Optionally, you can add a success message
        session()->flash('message', 'Your message has been sent successfully!');
    }

    public function render()
    {
        return view('livewire.contact');
    }
}