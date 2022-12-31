# Bonne année 2023 iOS - SwiftUI

Au niveau global, 2022 aura été une année vraiment difficile notamment avec l'inflation liée au conflit entre l'Ukraine et la Russie, mais avec une belle Coupe du Monde de la FIFA au Qatar riche en exploits historiques.

À titre personnel, 2022 aura été une année de progrès au niveau professionnel car j'ai enfin pu commencer ma carrière de développeur **iOS** chez Netgem et Withings. Même si je n'ai pas encore pu me stabiliser (avec les périodes d'essai), c'est déjà bien mieux que les années 2020 et 2021 qui ont été très difficiles moralement (avec le contexte COVID surtout).

Je vous propose ici une petite application **iOS** codée de façon authentique en natif avec **Xcode 14.2**, **Swift 5.7** et avec **SwiftUI** pour mes débuts sur ce framework d'Apple.

Par rapport à ceux que j'ai réalisé en 2020 et 2021, j'ai relevé le défi d'ajouter des animations et des transitions avec plusieurs textes. Les principaux challenges sont les suivants:
- Les animations dans des `ZStack` (conteneur pour empiler une vue au-dessus d'une autre). Pour que cela fonctionne, il faut exploiter la propriété `zIndex`, et surtout définir le bon ordre d'apparition des vues (images, textes, ...)
- Par rapport à **UIKit** pour le positionnement à l'aide des contraintes avec **Auto Layout**, c'est compliqué au début avec **SwiftUI** pour le positionnement, l'alignement et les marges.
- Le chaînage des animations entre les images et les textes avec un timer, le temps à définir pour les transitions,...

Avec **SwiftUI**, le code est tout de même plus simple qu'avec **UIKit** en nombre de lignes de code, en matière de possibilités de faire des vues personnalisées, comme par exemple avec:
- Un bouton avec une image de fond
```swift
struct GoldenButton: View {
    var body: some View {
        Text("Compte à rebours")
            .frame(width: UIScreen.main.bounds.width * 0.6, height: 50, alignment: .center)
            .foregroundColor(.black)
            .background(Image("GoldFoil"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
    }
}
```

![Golden Button Preview](https://github.com/Kous92/Happy-New-Year-2023-iOS-SwiftUI-FR/blob/main/GoldenButtonPreview.png)

- Un texte avec une couleur d'un fond d'image (ici de l'or):
```swift
Text("BONNE ANNÉE 2023")
    .font(.system(size: 55))
    .fontWeight(.medium)
    .foregroundStyle(.image(Image("GoldFoil")))
    .multilineTextAlignment(.center)
```

![Golden Text Preview](https://github.com/Kous92/Happy-New-Year-2023-iOS-SwiftUI-FR/blob/main/GoldenTextPreview.png)

L'application est disponible en 13 langues:
- Français
- Anglais
- Espagnol
- Arabe
- Kabyle
- Allemand
- Néerlandais
- Italien
- Portugais
- Turc
- Coréen
- Japonais
- Russe

**Voilà :)**

**En toutes circonstances, je vous souhaite une très bonne année 2023, bonne santé, meilleurs vœux. Qu'elle soit meilleure et qu'elle soit synonyme de progrès et de stabilité.**

# BONNE ANNÉE
# HAPPY NEW YEAR
# FELIZ AÑO NUEVO
# عام سعيد
# ASSEGWAS AMEGGAZ
# FROHES NEUES JAHR
# GELUKKIG NIEUWJAAR
# BUON ANNO
# FELIZ ANO NOVO
# MUTLU YILLAR
# 새해 복 많이 받으세요
# あけましておめでとうございます
# С НОВЫМ ГОДОМ