# Excla: A rewrite of the original Exclamation language interpreter

Exclamation is a macro-driven programming language which works right in your computer in the simplest ways.

To put it in perspective, here are some powershell measures.

```

.\excla sample.excla

Minutes           : 0
Seconds           : 0
Milliseconds      : 26
Ticks             : 269660
TotalDays         : 3.12106481481481E-07
TotalHours        : 7.49055555555556E-06
TotalMinutes      : 0.000449433333333333
TotalSeconds      : 0.026966
TotalMilliseconds : 26.966

.\bin\excla (OLD) sample.excla


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 34
Ticks             : 348220
TotalDays         : 4.03032407407407E-07
TotalHours        : 9.67277777777778E-06
TotalMinutes      : 0.000580366666666667
TotalSeconds      : 0.034822
TotalMilliseconds : 34.822

```

But it seems that both executables go between 10 - 50 in millisecond speed.

But the speed difference is barely noticable and the stability in the new Exclamation is better than the old one.

## Flexibility

Excla 2021 Edition contains a good deal of features, like `if`, `variables`, and more!