using System;

namespace NomeUtilizador
{
    class Program
    {
        static void Main(string[] args)
        {
            string nome;

            Console.WriteLine($"Escreva o seu nome: ");
            nome = Console.ReadLine();
            Console.WriteLine($"Olá {nome}");
            Console.ReadLine();
        }
        
    }
}
