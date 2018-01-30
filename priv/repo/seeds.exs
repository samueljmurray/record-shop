alias RecordShop.Artists.Artist
alias RecordShop.Records.Record
alias RecordShop.Repo

%Record{
  title: "Rain Dogs",
  year: 1985,
  artists:
  [
    %Artist{
      name: "Tom Waits"
    }
  ]
} |> Repo.insert!

%Record{
  title: "Gang Signs And Prayer",
  year: 2017,
  artists:
  [
    %Artist{
      name: "Stormzy"
    }
  ]
} |> Repo.insert!

%Record{
  title: "Kakashi",
  year: 1982,
  artists:
  [
    %Artist{
      name: "Yasuaki Shimizu"
    }
  ]
} |> Repo.insert!

%Record{
  title: "Collaborative Works",
  year: 2015,
  artists:
  [
    %Artist{
      name: "Ólafur Arnalds"
    },
    %Artist{
      name: "Nils Frahm"
    }
  ]
} |> Repo.insert!

%Record{
  title: "Clouds",
  year: 2017,
  artists:
  [
    %Artist{
      name: "Gigi Masin"
    }
  ]
} |> Repo.insert!