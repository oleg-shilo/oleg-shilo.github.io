<img align="right" src="https://raw.githubusercontent.com/oleg-shilo/cs-script/master/Source/wiki/images/css_logo_codeplex_256x256_2.png" alt="" style="float:right">

# CS-Script - v3.19.0

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://oleg-shilo.github.io/cs-script/Donation.html)

CS-Script is a CLR (Common Language Runtime) based scripting system which uses ECMA-compliant C# as a programming language.

CS-Script is one of the most mature C# scripting solutions. I become publicly available in a two years after the first release of .NET.
CS-Script supports both hosted and standalone execution model. It allows seamlessly switching underlying compiling technology without affecting the code base. Currently supported compilers are Mono, Roslyn and CodeDOM. It offers comprehensive integration with most common development tools.

_**For the all CS-Script details go to the project [Documentation Wiki](https://github.com/oleg-shilo/cs-script/wiki).**_
<hr/>

The following is a simple code sample just to give you the idea about the product:

```csharp
dynamic script = CSScript.LoadCode(
                           @"using System.Windows.Forms;
                             public class Script
                             {
                                 public void SayHello(string greeting)
                                 {
                                     MessageBox.Show($""Greeting: {greeting}"");
                                 }
                             }")
                             .CreateObject("*");
script.SayHello("Hello World!");
//-----------------
var product = CSScript.CreateFunc<int>(@"int Product(int a, int b)
                                         {
                                             return a * b;
                                         }");
int result = product(3, 4);
//-----------------
var SayHello = CSScript.LoadMethod(
                        @"using System.Windows.Forms;
                          public static void SayHello(string greeting)
                          {
                              MessageBoxSayHello(greeting);
                              ConsoleSayHello(greeting);
                          }
                          static void MessageBoxSayHello(string greeting)
                          {
                              MessageBox.Show(greeting);
                          }
                          static void ConsoleSayHello(string greeting)
                          {
                              Console.WriteLine(greeting);
                          }")
                         .GetStaticMethod("SayHello" , typeof(string));
SayHello("Hello again!");
```