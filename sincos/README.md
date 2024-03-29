# Making a weird periodic function

**Note:** This is a Pluto notebook. In order to run this file as *god* intended,
use the [`Pluto.jl`][plunto] package. Alternatively, you can open this in
Binder, I think.

It's widely known that the sine and cosine function are very similar, differing
only by a phase angle.
```math
\sin \theta = \sum_{k=0}^{\infty} \frac{ (-1)^k \theta^{2k+1} }
{\left(2k+1\right)!},$$
```
and
```math
\cos \theta = \sum_{k=0}^{\infty} \frac{ (-1)^k \theta^{2k} }{(2k)!} .
```
So, that leads me to wonder: is there a way to *interpolate* between the two
trigonometric functions?—and would it even be worth it in the first place?

Rather than trying to do some magic math—which I'm really *not* in the mood for
right now—instead notice that the only thing separating $\sin \theta$ and
$\cos \theta$ are the $2k + 1$ and $2k$ terms. Therefore, all you need to do to
interpolate is use some arbitrary variable $m$ that ranges between $0$ and $1$.
Therefore, we can define a new, weird function
```math
\mathrm{son}(\theta, m) = \sum_{k=0}^{\infty} \frac{ (-1)^k \theta^{2k + m} }
{ \left(2k + m\right)!} .
```
This function is not named after anything particular, and is chosen arbitrarily 
because "son" sounds like a weird hybrid between "sine" and "cosine".

![m = 0.0](img/m=0.svg)

![m = 0.25](img/m=0.25.svg)

![m = 0.5](img/m=0.5.svg)

![m = 0.75](img/m=0.75.svg)

![m = 1.0](img/m=1.0.svg)



[plunto]: https://github.com/fonsp/Pluto.jl
