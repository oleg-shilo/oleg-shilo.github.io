<img align="right" id="logo" src="" alt="" style="float:right"/>

# CS-Script Branches 

<!-- [![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://oleg-shilo.github.io/cs-script/Donation.html) -->

<div class="row">
    <i>
        <div class="column" style="background-color:whitesmoke; ">
          <h2><a href="https://oleg-shilo.github.io/cs-script">CS-Script Engine</a></h2>
          <p> CS-Script is one of the most mature C# scripting solutions. It became publicly available in 2004, just two years after the first release of .NET.</p>
          <p>CS-Script supports both hosted and standalone execution model. This makes it possible to use the script engine as a pure C# alternative for PowerShell or Bash. As well as extending .NET applications with C# scripts executed at runtime by the hosted script engine.</p>
          <p>It can be run on Win, Linux and Mac.  And it is compatible with .NET 5/Core and higher.</p>
        </div>

        <div class="column column-space"></div>
        
        <div class="column column" style="background-color:whitesmoke;">
        <h2><a href="https://www.cs-script.net/integration">Development Tools Integration</a></h2>
          <p>CS-Script also offers comprehensive integration with most common development tools and utilities: 
          </p><ul>
            <li><a href="https://github.com/oleg-shilo/cs-script/wiki/CS-Script---Command-Line-Interface#-vs">Visual Studio</a> (built-in feature via <code>-vs</code> CLI argument)</li>
           
            <li><a href="https://github.com/oleg-shilo/cs-script.vscode">VSCode</a></li>
            <li><a href="https://github.com/oleg-shilo/cs-script-sublime">Sublime Text 3</a></li>
            <li><a href="https://github.com/oleg-shilo/cs-script.npp">Notepad++</a> .</li>
            <li><em>Shells:</em>
            <ul dir="auto">
              <li>Command Prompt </li>
              <li>Bash shell</li>
              <li>Chocolaty</li>
              <li>Windows Explorer</li>
            </ul>
          </ul>
          <p></p>
        </div>
    </i>
</div>

<hr/>

CS-Script is a CLR (Common Language Runtime) based scripting system which uses ECMA-compliant C# as a programming language. CS-Script today is one of the most mature C# scripting solutions. 
 
CS-Script supports both hosted and standalone execution model. It allows seamlessly switching underlying compiling technology without affecting the code base. Currently supported compilers are Mono, Roslyn and CodeDOM. It offers comprehensive integration with most common development tools.

_For all CS-Script details visit project [Documentation Wiki](https://github.com/oleg-shilo/cs-script/wiki)._
<hr/>

The following is a simple code sample just to give you the idea about the platform:

_Executing scripts from a .NET host application:_
_**Hosting script engine**_
```csharp
dynamic script = CSScript.LoadCode(@"using System.Windows.Forms;

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
var SayHello = CSScript.LoadMethod(@"using System.Windows.Forms;

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

_**Executing script from shell**_

Updating media file tags. 
Note, the script is using optional classless layout.

_Script file: `mp4_retag.cs`_

```csharp
//css_nuget taglib
using System;
using System.IO;

string source = @"\\media-server\tv_shows\Get Smart\Season1";

void main()
{
    foreach (string file in Directory.GetFiles(source, "*.mp4"))
    {
        string episode_name = Path.GetFileNameWithoutExtension(file);

        var mp4 = TagLib.File.Create(file);
        mp4.Tag.Title = episode_name;
        mp4.Save();

        Console.WriteLine(episode_name);
    }
}
```
Execute script file directly in cmd-prompt without building an executable assembly:
```
C:\Temp>cscs mp4_retag.cs
```
