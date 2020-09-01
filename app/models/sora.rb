class Sora < ActiveHash::Base
      self.data = [
      { id: 1, shippingfee: '--' },
      { id: 2, shippingfee: '着払い（購入者負担)' },
      { id: 3, shippingfee: '送料込み(出品者負担' }
    ]
end
