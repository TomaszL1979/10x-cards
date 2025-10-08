# Supabase lokalnie - Windows

Supabase CLI możesz zainstalować lokalnie w projekcie i korzystać z niego przez `npx`, bez potrzeby instalacji globalnej. Ten sposób jest wspierany oficjalnie i eliminuje błędy związane z blokadą globalnej instalacji przez npm.

### Kroki instalacji lokalnej Supabase CLI

1. **Zainstaluj Supabase CLI lokalnie w folderze projektu:**

```
npm install supabase --save-dev
```

Dzięki temu CLI pojawi się w katalogu `node_modules` i nie będzie dostępne w całym systemie, tylko w obrębie jednej aplikacji.
2. **Uruchamiaj komendy za pomocą npx:**

```
npx supabase <komenda>
```

Przykład inicjalizacji projektu:

```
npx supabase init
```

Przykład uruchomienia lokalnego backendu:

```
npx supabase start
```

Wszystkie polecenia Supabase CLI należy uruchamiać z prefiksem `npx`, jeśli instalacja jest lokalna.
3. **Możesz aktualizować CLI przy pomocy:**

```
npm update supabase --save-dev
```

Nowa wersja CLI zostanie pobrana przy kolejnej instalacji/aktualizacji.

### Podstawowe komendy dla lokalnego środowiska

- Inicjalizacja Supabase w katalogu projektu:

```
npx supabase init
```

- Uruchomienie serwisów Supabase lokalnie przez Docker:

```
npx supabase start
```

- Zatrzymywanie środowiska lokalnego:

```
npx supabase stop
```


### Wymagania dodatkowe

- Potrzebny jest Docker Desktop lub jego zamiennik (Podman, Rancher Desktop), bo Supabase uruchamia lokalnie bazy PostgreSQL, API, Auth, Storage itd.

Ten sposób instalacji gwarantuje aktualność wersji CLI w każdym projekcie, lepszą zgodność z zależnościami JS/TS i jest zalecany przez twórców Supabase.