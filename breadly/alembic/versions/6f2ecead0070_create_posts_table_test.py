"""create posts table test

Revision ID: 6f2ecead0070
Revises: 56de5070b1f7
Create Date: 2023-11-25 21:11:11.517063

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '6f2ecead0070'
down_revision: Union[str, None] = '56de5070b1f7'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    pass


def downgrade() -> None:
    pass
