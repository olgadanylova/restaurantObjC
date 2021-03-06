
#import "ShoppingCartCell.h"
#import "Picture.h"
#import "UserDefaultsHelper.h"
#import "ShoppingCart.h"

@implementation ShoppingCartCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)saveChangedQuantity:(id)sender quantity:(NSInteger)quantity {
    self.shoppingCartItem.quantity = [NSNumber numberWithInteger:quantity];
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.superview];
    NSIndexPath *indexPath = [(UITableView *)self.superview indexPathForRowAtPoint:buttonPosition];
    [userDefaultsHelper saveShoppingCartItem:self.shoppingCartItem atIndex:indexPath.row];
    self.quantityTextField.text = [NSString stringWithFormat:@"%@", self.shoppingCartItem.quantity];
    shoppingCart.totalPrice = @0;
    [((UITableView *)self.superview) reloadData];
}

- (IBAction)pressedDecreaseproperty:(id)sender {
    NSInteger quantity = [self.shoppingCartItem.quantity integerValue];
    if ( quantity >= 2) {
        quantity--;
    }
    [self saveChangedQuantity:sender quantity:quantity];
}

- (IBAction)pressedIncreaseQuantity:(id)sender {
    NSInteger quantity = [self.shoppingCartItem.quantity integerValue];
    quantity++;
    [self saveChangedQuantity:sender quantity:quantity];
}

@end
