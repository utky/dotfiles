{ pkgs }:
{
    #haskellngPackages = pkgs.haskellngPackages.override {
    #  overrides = self: super: {
    #    sql-words = super.sql-words.override {
    #      mkDerivation = (attrs: self.mkDerivation (attrs // { doCheck = false; }));
    #    };
    #    relational-query = super.relational-query.override {
    #      mkDerivation = (attrs: self.mkDerivation (attrs // { doCheck = false; }));
    #    };
    #  };
    #};
}
