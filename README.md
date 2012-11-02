Esta pequena gem facilita a criação do formulário para integração com a globalização da gem [Globalize3](https://github.com/svenfuchs/globalize3/)

O Globalize Inpunts Bootstrap é uma alteração da gem [ActiveAdmin-Globalize3-inputs](https://github.com/corewebdesign/ActiveAdmin-Globalize3-inputs)

## Instalação

Adicione a seguinte linha ao seu Gemfile:

    gem 'globalize3-inputs-bootstrap'

E execute o comando:

    $ bundle install

## Exemplo de uso

```ruby
ActiveAdmin.register Gallery do
  form do |f|
    f.globalize_inputs :translations do |lf|
      lf.inputs do
        lf.input :title
        lf.input :description

        lf.input :locale, :as => :hidden
      end
    end

    f.has_many :photos do |photo|
      photo.inputs do
        photo.input :image, :as => :file
      end

      photo.globalize_inputs :translations do |lp|
        lp.inputs do
          lp.input :description

          lp.input :locale, :as => :hidden
        end
      end
    end

    f.buttons
  end
end
```
Como você pode ver, não há nenhuma opção especial para as localidades. A lista é tirada de `I18n.available_locales`, então você provavelmente vai querer definir as localidades em que seu aplicativo funciona.

## Contribua

1. Faça um 'Fork'
2. Melhore
3. Faça um 'Pull Request'
