# Yemek Tarifleri Uygulaması

Bu proje, yemek tarifleri sunan bir mobil uygulamadır. Flutter kullanılarak geliştirilmiştir ve REST API'den veri çekmektedir. Uygulama, kullanıcıların favori yemek tariflerini eklemelerine olanak tanır.

## Özellikler

- Kategorilere göre yemek tariflerini listeleme
- Yemek tariflerinin detaylarını görüntüleme
- Favori yemek tariflerini ekleyebilme ve çıkarabilme
- Animasyonlu geçişler
- Asenkron veri alışverişi

## Classlar

### `main.dart`

Uygulamanın giriş noktası. Uygulamanın ana ayarlarını yapar ve sağlayıcıları (providers) tanımlar.

### `home_screen.dart`

Ana ekran class'ı. Yemek kategorilerini listeler ve kullanıcıların kategorilere göre yemek tariflerini görüntülemesine olanak tanır.

### `category_meals_screen.dart`

Belirli bir kategorideki yemek tariflerini listeleyen ekran. Kullanıcıların seçtikleri kategoriye göre yemek tariflerini görüntülemelerini sağlar.

### `meal_detail_screen.dart`

Bir yemek tarifinin detaylarını gösteren ekran. Kullanıcılar tarifin detaylarını görüntüleyebilir ve favorilerine ekleyebilir.

### `favorites_screen.dart`

Kullanıcının favori yemek tariflerini listeleyen ekran. Kullanıcılar favori tariflerini buradan yönetebilir.

### `api_service.dart`

API servis class'ı. Yemek tariflerini ve kategorilerini TheMealDB API'sinden çekmek için kullanılır.

#### Metodlar:

- `fetchCategories()`: Tüm yemek kategorilerini çeker.
- `fetchMealsByCategory(String category)`: Belirli bir kategorideki yemek tariflerini çeker.
- `fetchMealDetail(String mealId)`: Belirli bir yemeğin detaylarını çeker.

### `meal_model.dart`

Yemek tariflerini temsil eden model class'ı. API'den gelen JSON verilerini Dart nesnelerine dönüştürmek için kullanılır.

#### Özellikler:

- `idMeal`: Yemeğin ID'si
- `strMeal`: Yemeğin adı
- `strCategory`: Yemeğin kategorisi
- `strArea`: Yemeğin bölgesi
- `strInstructions`: Yemeğin talimatları
- `strMealThumb`: Yemeğin görseli
- `ingredients`: Yemeğin malzemeleri

### `favorite_provider.dart`

Favori yemek tariflerini yöneten sağlayıcı (provider) class'ı. Uygulama genelinde favori tariflerin durumunu yönetir.

#### Metodlar:

- `addMealToFavorites(Meal meal)`: Bir yemeği favorilere ekler.
- `removeMealFromFavorites(String mealId)`: Bir yemeği favorilerden çıkarır.
- `isFavorite(String mealId)`: Bir yemeğin favorilerde olup olmadığını kontrol eder.

### `category_provider.dart`

Yemek kategorilerini yöneten sağlayıcı (provider) class'ı. Kategorilerin durumunu yönetir.

## Kullanılan Paketler

- `provider`: State management için kullanılır.
- `http`: HTTP istekleri yapmak için kullanılır.

## Kurulum

1. Bu depoyu klonlayın:
    ```sh
    git clone https://github.com/kullanici_adi/yemek_tarifleri.git
    ```

2. Proje dizinine gidin:
    ```sh
    cd yemek_tarifleri
    ```

3. Gerekli paketleri yükleyin:
    ```sh
    flutter pub get
    ```

4. Uygulamayı çalıştırın:
    ```sh
    flutter run
    ```

## API

Bu proje [TheMealDB API](https://www.themealdb.com/api.php) kullanmaktadır.

## Lisans

Bu proje MIT Lisansı ile lisanslanmıştır. Daha fazla bilgi için `LICENSE` dosyasına bakabilirsiniz.


A new Flutter project created with FlutLab - https://flutlab.io

## Getting Started

A few resources to get you started if this is your first Flutter project:

- https://flutter.dev/docs/get-started/codelab
- https://flutter.dev/docs/cookbook

For help getting started with Flutter, view our
https://flutter.dev/docs, which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Getting Started: FlutLab - Flutter Online IDE

- How to use FlutLab? Please, view our https://flutlab.io/docs
- Join the discussion and conversation on https://flutlab.io/residents