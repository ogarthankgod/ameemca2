<?php

namespace Database\Seeders;

// use App\Models\User;
use App\Models\User_type;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();
        User_type::insert([
            [
                'type' => 'user',
                'email' => 'staff@ameemca.com',
                'title' => 'Staff',
                'comment' => 'Staff',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'type' => 'admin',
                'email' => 'president@ameemca.com',
                'title' => 'President',
                'comment' => 'president',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'type' => 'admin',
                'email' => 'finsec@ameemca.com',
                'title' => 'Finsec',
                'comment' => 'Finsec',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'type' => 'admin',
                'email' => 'gensec@ameemca.com',
                'title' => 'Gensec',
                'comment' => 'Gensec',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'type' => 'admin',
                'email' => 'treasurer@ameemca.com',
                'title' => 'Treasurer',
                'comment' => 'Treasurer',
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
